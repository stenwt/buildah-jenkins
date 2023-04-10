FROM quay.io/buildah/stable:latest
RUN dnf update -y \
    && dnf install -y openssh-server java-1.8.0-openjdk-devel java-1.8.0-openjdk\
    && dnf clean all \
    && install -d /home/build/.ssh --mode 700 --owner build --group build\
    && install -d /home/build/workspace --mode 700 --owner build --group build\
    && /usr/libexec/openssh/sshd-keygen ecdsa \
    && /usr/libexec/openssh/sshd-keygen rsa

EXPOSE 22
ENTRYPOINT ["/usr/sbin/sshd"]
CMD ["-D", "-e"] 
