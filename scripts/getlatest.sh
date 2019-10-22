#!/bin/bash

mkdir naftis
curl -L https://api.github.com/repos/bullteam/zeus-admin/tarball | tar -zx -C zeus --strip-components=1

cd naftis
curl -s https://api.github.com/repos/bullteam/zeus-admin/releases/latest | grep "browser_download_url" | cut -d : -f 2,3 | tr -d \" | wget -qi - && tar zxvf manifest.tar.gz

