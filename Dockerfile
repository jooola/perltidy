FROM perl:slim AS builder
COPY . build/
WORKDIR build/
RUN perl Makefile.PL && make install

FROM perl:slim
COPY --from=builder /usr/local /usr/local
ENTRYPOINT ["perltidy"]
CMD ["-h"]
