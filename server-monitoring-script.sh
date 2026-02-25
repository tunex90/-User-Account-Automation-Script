# Variable
DATE=$(date '+%Y-%m-%d %H:%M:%S')
HOSTNAME=$(hostname)

# Disk usage check (partition)
disk_usage=$(df / | awk 'NR==2 {gsub("%",""); print $5}')

# Memory usage check
mem_usage=$(free | awk '/Mem:/ {printf("%.0f"), $3/$2 * 100}')

# CPU load
CPU_load=$(uptime | awk '{print $(NF - 2)}' | sed 's/,//')


# Start log entry
echo "--------------------------------------------" >> $log_file
echo "date: $DATE" >> $log_file
echo "hostname: $HOSTNAME" >> $log_file
echo "disk usage: $disk_usage%" >> $log_file
echo "memory usage: $mem_usage%" >> $log_file
echo "CPU load: $CPU_load" >> $log_file


# Check disk usage
if [ "$disk_usage" -gt 80 ]; then
        echo "WARNING: Disk usage is above 80%!" | tee -a $log_file
fi

# Check memory usage
if [ "$mem_usage" -gt 75 ]; then
        echo "WARNING: Memory usage is above 75%!" | tee -a $log_file
fi

echo "" >> $log_file
