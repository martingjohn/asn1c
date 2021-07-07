# asn1c

Run sharing a directory

docker run \
       -it \
       --rm \
       -v /asn1:/asn1 \
       martinjohn/asn1c

In container build compiler

asn1c -fcompound-names /asn1/spec.asn1
make -f converter-example.mk
cp converter-exampl /asn1/spec.bin 

exit container

List types

/asn1/spec.bin -p list

Convert from ber to xer
/asn1/spec.bin -p type -iber -oxer input > output
