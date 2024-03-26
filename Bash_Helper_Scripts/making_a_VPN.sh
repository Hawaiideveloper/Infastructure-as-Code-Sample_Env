# 1st have 3 network virtual cards




# 1st card is for public internet access  vLAN69


# 2nd card is for internal access  vLAN717


# 3rd card is for port-fowarding  to a proxy and the reverse proxy wouuld handle 

traffic for intranet vLAN777



|----------|
|_NIC_1____|----------->



             ___.....___
       ,..-.=--.-.       "".
     .{_..        `        ,. .
   .'     \      /        | ,'.\`.
  /        :   ;'          `____> \
 :         `. (           /       :
 |           `>\_         \      r|
             /   \         `._   \
 |          |      `          ;   |
  :          \     /          `   ;
   \          \.  '            ` /
     `.        | /             .'
        `      `/          . '
           `---'.....---''
            
|----------|
|_NIC_2____|----------->


  ___   _      ___   _      ___   _      ___   _      ___   _
 [(_)] |=|    [(_)] |=|    [(_)] |=|    [(_)] |=|    [(_)] |=|
  '-`  |_|     '-`  |_|     '-`  |_|     '-`  |_|     '-`  |_|
 /mmm/  /     /mmm/  /     /mmm/  /     /mmm/  /     /mmm/  /
       |____________|____________|____________|____________|
                             |            |            |
                         ___  \_      ___  \_      ___  \_
                        [(_)] |=|    [(_)] |=|    [(_)] |=|
                         '-`  |_|     '-`  |_|     '-`  |_|
                        /mmm/        /mmm/        /mmm/





|----------|
|_NIC_3____|----------->


Internal Applications <-------> Web_Server/proxy <------> Public vLAN69



      
                                 


Permissions are:

Internal can see internal, and use public route for internet



example: 1st card can only go out and view but cannot receive FTP, HTTP, or SSH

2nd card can server ssh, scp, and 80/8080, as well as DNS, DHCP, and others

3rd card is the production route, whereas it hosts to the public what we expose from the site like webpages and web services,  network like 
