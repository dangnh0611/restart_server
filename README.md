# restart_server
restart server: start services, logging, health-check

## Health-check on agents
### Install Netdata
Netdata can be easily downloaded and installed via `curl` and installer script:
```bash
$ bash <(curl -Ss https://my-netdata.io/kickstart.sh) --stable-channel --disable-telemetry
```
>More: https://learn.netdata.cloud/docs/agent/packaging/installer
### Enable GPU monitoring
GPU monitoring function requires `nvidia-smi` as dependence. By default, nvidia-smi is already installed with nvidia driver. First, make sure that nvidia-smi is available on your host:
```bash
$ nvidia-smi -h
```
If not, install/re-install the nvidia driver and make sure `nvidia-smi` works well.  
Edit configuration file:
- ``` bash
    $ cd /etc/netdata
    ```
- Edit the configuration file at `/usr/lib/netdata/conf.d/python.d.conf`, e.g 
    ```bash
    $ sudo nano /usr/lib/netdata/conf.d/python.d.conf
    ```
- Remove the hash `#` at the line contain `nvidia_smi: yes` to enable the nvidia-smi extension.
- Save the configuration file
- Restart Netdata service:
    ```bash
    $ sudo systemctl restart netdata
    # or
    $ sudo service netdata restart
    ```

Once enabled, visit netdata web UI at http://localhost:19999/  
Verify that gpu monitoring is enabled  
![nvidia-smi](screenshots/nvidia-smi_extension.png)   
![gpu_monitor](screenshots/gpu_monitor.png)

### Multihost monitoring
Netdata does its jobs by running an unique Netdata service on each hosts.
To claim node, follow the instructions at https://learn.netdata.cloud/docs/agent/claim 



