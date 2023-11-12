#!/bin/sh

go install -v github.com/cweill/gotests@latest
go install -v github.com/davidrjenni/reftools/cmd/fillstruct@latest
go install -v github.com/fatih/gomodifytags@latest
go install -v github.com/go-delve/delve/cmd/dlv@latest
go install -v github.com/godoctor/godoctor@latest
go install -v github.com/golangci/golangci-lint/cmd/golangci-lint@latest
go install -v github.com/haya14busa/gopkgs/cmd/gopkgs@latest
go install -v github.com/josharian/impl@latest
go install -v github.com/juntaki/gogtags@latest
go install -v github.com/mdempsky/gocode@latest
go install -v github.com/rogpeppe/godef@latest
go install -v github.com/zmb3/gogetdoc@latest
go install -v golang.org/x/lint/golint@latest
go install -v golang.org/x/tools/cmd/godoc@latest
go install -v golang.org/x/tools/cmd/goimports@latest
go install -v golang.org/x/tools/cmd/gorename@latest
go install -v golang.org/x/tools/cmd/guru@latest
go install -v golang.org/x/tools/gopls@latest
