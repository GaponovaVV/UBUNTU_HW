#!/bin/bash
#
echo "Web Server Logs Report"
echo "=================="

        awk '
        /"[^"]*"/ {
            ip[$1]++;
                total++;
                    gsub(/"/, "",$6);
                        if ($6 != "") method[$6]++;
                            if ($7 != "") url[$7]++;
                            }
                            END {
                                print "Total number of requests: " (total ? total : 0)
                                    print "Number of unique IP addresses: " length(ip)
                                        print "Number of requests by method: "
                                            for (i in method) print method[i], i
                                                print "Most popular URL: "
                                                    max = 0
                                                        for (u in url) {
                                                                if (url[u] > max) {
                                                                            max = url[u]
                                                                                        most_popular = u
                                                                                                }
                                                                                                    }
                                                                                                        if (max > 0) print most_popular, "with", max, "requests"
                                                                                                            else print "No URLs found"
                                                                                                            }' access.log
