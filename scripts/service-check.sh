# Service health-check
ERRORS=0
# Some checks
# Modify $ERROR if needed, corresponding to the error code
# ..

# Restart service if any troubles detected
echo "---SUMMARY---"
date
if [$ERROR -gt 0]
then
    echo "Error of code $ERROR detected!"
    echo "RESTARTING SERVICE.."
    sudo restart.sh >> /var/log/restart.log 2>&1
else
    echo "NO ERRORS detected!"
fi