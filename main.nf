#!/usr/bin/env nextflow
nextflow.enable.dsl=2
params.sleep = 60
params.pcm = "medium-priority-np"
params.memory = "0.6 GB"

process go_sleep {
    pod priorityClassName: "${params.pcm}"
    memory "${params.memory}"
    cpus 0.1
    
    script:
    """
    sleep ${params.sleep}
    """
}

workflow {
    go_sleep()
}
