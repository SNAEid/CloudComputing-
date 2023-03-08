# CloudComputing-

2- 
LunixStatus.sh
./script2.sh 


3- chmode +x LunixStatus 
    to make Script executable 
   
    dd the directory containing the script to the PATH environment variable 
    export PATH=$PATH:/Downlads/assignment2/script
    
    source ~/.bashrc
    
    from anyware LunixStatus
    
4- crontab -e 

0 0 * * * /Downlads/assignment2/script2.sh
add lcmand end of the crontab file to run the script daily at midnight:

script should run every day at midnight
