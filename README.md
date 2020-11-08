# fluent-bit-lua-splunk
This script will help to map dynamic index to the events in fluent Bit using Lua

The sample function can be called as filter in FluentBit 

                [FILTER]
                    Name      lua
                    Match     kube.*
                    script rename_index.lua
                    Protected_mode true
                    call index_map

This will create a sample payload like below:-

[11183] kube.var.log.containers.fluent-bit-cbn2p_logging_fluent-bit-d151bbaeb9825e25b397ffb48dd532563767ff654ea755f3346c3542b14847ec.log: [1604829094.828177427, {"event"=>{"log"=>"", "cluster_id"=>"dev-mls01", "stream"=>"stdout", "time"=>"2020-11-08T09:51:31.86148052Z", "kubernetes"=>{"pod_name"=>"fluent-bit-cbn2p", "labels"=>{"app"=>"mls-fluentbit"}, "namespace_name"=>"logging", "container_image"=>"/fluent/fluent-bit:1.6.0", "container_name"=>"fluent-bit", "host"=>"istio2-vmss00000l"}}, "index"=>"dummy_logging", "sourcetype"=>"_json"}]
", "cluster_id"=>"dev-mls01", "stream"=>"stdout", "time"=>"2020-11-08T09:51:34.828177427Z", "kubernetes"=>{"pod_name"=>"fluent-bit-cbn2p", "labels"=>{"app"=>"mls-fluentbit"}, "namespace_name"=>"logging", "container_image"=>"fluent/fluent-bit:1.6.0", "container_name"=>"fluent-bit", "host"=>"istio2-vmss00000l"}}, "index"=>"dummy_logging", "sourcetype"=>"_json"}]




# delete labels will be used to delete the selected labels from the logs.
