FROM ubuntu:24.10

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y bash-completion git curl sudo docker.io
RUN curl https://go.dev/dl/go1.23.4.linux-arm64.tar.gz --location --output go1.23.4.linux-arm64.tar.gz
RUN tar -C /usr/local -xzf go1.23.4.linux-arm64.tar.gz
RUN rm go1.23.4.linux-arm64.tar.gz

ENV GOBIN=/home/ubuntu/go/bin
ENV PATH=$PATH:/usr/local/go/bin:$GOBIN

RUN echo 'ubuntu ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN groupadd --gid 988 --users ubuntu dockerp 

USER ubuntu
RUN <<DOCKERFILE_EOD

cat <<-EOD >> ~/.bashrc

	if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
		. /etc/bash_completion
	fi

	export GOBIN=${GOBIN}
	export PATH=${PATH}

EOD

DOCKERFILE_EOD

RUN <<DOCKERFILE_EOD

go install golang.org/x/tools/gopls@latest 
go install github.com/go-delve/delve/cmd/dlv@latest 
go install honnef.co/go/tools/cmd/staticcheck@latest

DOCKERFILE_EOD
