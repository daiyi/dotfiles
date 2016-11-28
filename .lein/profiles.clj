{:user {:plugins [[cider/cider-nrepl "0.8.2"]
                  [venantius/ultra "0.5.0"]]
        :mirrors {#"central" {:name "central"
                              :url "http://uk.maven.org/maven2"}}
        :repl-options {:prompt (fn [ns]
                                   (str "\033[38;5;245m"
                                        ns "=>"
                                        "\033[0m "))}}}
