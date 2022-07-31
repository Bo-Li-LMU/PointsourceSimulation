#!/bin/bash

####strike##for i in {0 15 30 45 60 75 90 105 120 135 150 165 180}
for i in {0..13} ##{0..13}  
do
	##echo $(($i*15))
    ####dip##for j in {10 20 30 40 50 60 70 80 90}
        for j in {1..9} ##{1..9}
        do
            ##echo $(($j*10))
            ####rake##for k in {0 15 30 45 60 75 90 105 120 135 150 165 180}
                for k in {0..13} ##{0..13}
                do
                    ##echo $(($k*15))
                    mkdir strike$(($i*15))_dip$(($j*10))_rake$(($k*15))
                    sed 's/strike=0/'strike="$(($i*15))"'/g' generate_source.py > ./trans.py
                    sed 's/dip=90/'dip="$(($j*10))"'/g' trans.py >> ./trans.py
                    sed 's/rake=0/'rake="$(($k*15))"'/g' trans.py >> ./strike$(($i*15))_dip$(($j*10))_rake$(($k*15))/generate_source.py
                    rm trans.py
                    cd strike$(($i*15))_dip$(($j*10))_rake$(($k*15))
                    python generate_source.py
                    /hppfs/work/pr63qo/di52lap2/local/bin/rconv -i source.srf -o source.nrf -m "+proj=tmerc +datum=WGS84 +k=0.9996 +lon_0=0 +lat_0=0" -x visualization.xdmf
                    cp ../parameters_o4.par ./
                    cp ../testjob.sh ./
                    mkdir output_o4
                    cd ..
                done    
        done

done
