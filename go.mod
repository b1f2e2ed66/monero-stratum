module github.com/b1f2e2ed66/monero-stratum

go 1.15

require (
	github.com/goji/httpauth v0.0.0-20160601135302-2da839ab0f4d
	github.com/gorilla/mux v1.8.0
	github.com/sammy007/monero-stratum v0.0.0-20191029023423-25f94e28a33e
	github.com/yvasiyarov/go-metrics v0.0.0-20150112132944-c25f46c4b940 // indirect
	github.com/yvasiyarov/gorelic v0.0.7
	github.com/yvasiyarov/newrelic_platform_go v0.0.0-20160601141957-9c099fbc30e9 // indirect
)

replace github.com/sammy007/monero-stratum => ../monero-stratum