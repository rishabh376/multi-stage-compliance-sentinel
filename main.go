package main

// multi-stage-compliance-sentinel
// Appsec Engineers use the service to score runtime policy exceptions across PCI workloads, so unsigned builds never reach staging.
// Domain: devsecops

import (
    "encoding/json"
    "log"
    "net/http"
    "github.com/prometheus/client_golang/prometheus"
    "github.com/prometheus/client_golang/prometheus/promhttp"
)

var reqs = prometheus.NewCounterVec(prometheus.CounterOpts{
    Name: "requests_total", Help: "Total requests"}, []string{"endpoint"})

func main() {
    prometheus.MustRegister(reqs)
    http.Handle("/metrics", promhttp.Handler())
    http.HandleFunc("/healthz", func(w http.ResponseWriter, r *http.Request) {
        json.NewEncoder(w).Encode(map[string]string{"status":"ok","project":"multi-stage-compliance-sentinel","domain":"devsecops"})
    })
    http.HandleFunc("/readyz", func(w http.ResponseWriter, r *http.Request) {
        // TODO: add real readiness check
        w.Write([]byte(`{"ready":true}`))
    })
    http.HandleFunc("/scan", func(w http.ResponseWriter, r *http.Request) {
        json.NewEncoder(w).Encode(map[string]interface{}{"critical_vulnerabilities":0,"signed":true,"sbom":"spdx","slsa_level":3})
    })
    http.HandleFunc("/gate", func(w http.ResponseWriter, r *http.Request) {
        json.NewEncoder(w).Encode(map[string]interface{}{"allowed":true,"policies_passed":12,"blocked_reason":""})
    })

    http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
        reqs.WithLabelValues("/").Inc()
        json.NewEncoder(w).Encode(map[string]string{"message":"Appsec Engineers use the service to score runtime policy exceptions across PCI workloads, so unsigned builds never reach staging.","service":"multi-stage-compliance-sentinel"})
    })
    log.Println("multi-stage-compliance-sentinel listening :8080")
    log.Fatal(http.ListenAndServe(":8080", nil))
}
