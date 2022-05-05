# github.com/cmattoon/x

[![golangci](https://golangci.com/badges/github.com/cmattoon/x.svg)](https://golangci.com/r/github.com/cmattoon/x)
[![GoDoc](https://img.shields.io/badge/pkg.go.dev-doc-blue)](http://pkg.go.dev/github.com/cmattoon/x)
[![Go Report Card](https://goreportcard.com/badge/github.com/cmattoon/x)](https://goreportcard.com/report/github.com/cmattoon/x)

Package x provides a bunch of random utilities that may or may not actually work at any given time.

From the envutil package:

```go
envmap := x.Environ()
```

## Functions

### func [Environ](/exports.go#L16)

`func Environ() map[string]string`

Environ() returns os.Environ() as a map.

## Sub Packages

* [awsutil](./awsutil): package awsutil contains utility functions for working with AWS

* [envutil](./envutil): package envutil provides utility functions for working with environment variables.

* [web3util](./web3util): package web3util provides functionality for Web3 stuff, whatever that is

---
Readme created from Go doc with [goreadme](https://github.com/posener/goreadme)
