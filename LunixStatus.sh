


function display_menu {
    clear     
    echo "name script  $0 " 
    echo "---------------------------------------------------"
    echo "      Welcome $(whoami) to the first Script !"
    echo "---------------------------------------------------"
    echo "Today's date is: $(date '+%Y-%m-%d') ubuntu $(lsb_release -d |cut -f 2) version "
    echo ""
    echo "PLEASE SELECT AN OPTION "
    echo "1. List the running processes"
    echo "2. Check memory status and free memory in RAM"
    echo "3. Check hard disk status and free memory in HDD"
    echo "4. Check if Apache is installed and return its version"
    echo "5. Exit"
  
}
#############################################################
function display_options_menu {
  echo ""
  echo "Please select an option:"
  echo "1. Back to main menu"
  echo "2. Update the view"
  echo "3. Exit"
}
#####################################################################
function ListProcesses {
clear 
echo "List of running processses "
ps aux 
echo ""
read -p "Press enter to go back to the main menu "
}

#######################################################################
function MemoryStatus {
    clear
    echo "Memory status:"
    free -m
    echo ""
    read -p "Press enter to go back to the main menu"
}
#######################################################################
function HardDiskStatus {
clear
echo "the hard disk status : "
df -h 
echo ""
read -p "Press enter to go back to the main menu"

}
#######################################################################
function ApacheStatus {
clear 
if ! command -v apache2 >/dev/null ; then
 echo "Apache is not installed"
 else
 echo "Apache version: $(apache2 -v | grep version)"
 fi
 echo ""
 read -p "Press enter to go back to the main menu"
}


################################################################

while true; do 
    display_menu
    read -p " PLease Selext an OPtion : " Option 
    case $Option in 
    1|p)
      ListProcesses 
      display_options_menu
       read -p "Enter your choice: " subchoice
       case $subchoice in
         1) continue;;
         2) display_menu;;
         3) exit;;
         *) echo "Invalid option"; exit 1;;
       esac;; 
    2|r)
      MemoryStatus 
      display_options_menu
      read -p "Enter your choice: " subchoice
      case $subchoice in
         1) continue;;
         2) display_menu;;
         3) exit;;
         *) echo "Invalid option"; exit 1;;
       esac;; 
    3|h)
      HardDiskStatus
      display_options_menu
      read -p "Enter your choice: " subchoice
      case $subchoice in
         1) continue;;
         2) display_menu;;
         3) exit;;
         *) echo "Invalid option"; exit 1;;
       esac;;    
    4|a)
      ApacheStatus 
      display_options_menu
      read -p "Enter your choice: " subchoice
      case $subchoice in
         1) display_menu;;
         2) $current_function ;;
         3) exit;;
         *) echo "Invalid option"; exit 1;;
       esac;;  
    5)
      exit ;; 
    *) 
      echo "Incvalid Choice $Option" ;exit 1 ;; 
    esac 
done 
