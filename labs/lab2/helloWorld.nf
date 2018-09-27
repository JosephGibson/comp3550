#!/usr/bin/env nextflow
greetings = Channel.from ('hello', 'hola', 'ciao', 
'bonjour')
process sayHelloWorld {
input:
    val x from greetings
output:
    file 'HelloWorld.txt' into hellos
script:
"""
echo "$x world!" > HelloWorld.txt
"""
}
hellos
.collectFile(name: file("allHelloWorld.txt"))