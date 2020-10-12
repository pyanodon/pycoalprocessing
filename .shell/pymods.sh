git clone git@github.com:pyanodon/pycoalprocessing.git
git clone git@github.com:pyanodon/pyalienlife.git
git clone git@github.com:pyanodon/pyrawores.git
git clone git@github.com:pyanodon/pyfusionenergy.git
git clone git@github.com:pyanodon/pypetroleumhandling.git
git clone git@github.com:pyanodon/pyhightech.git
git clone git@github.com:pyanodon/pyindustry.git
git clone git@github.com:pyanodon/pyaliens.git
git clone git@github.com:pyanodon/pyfusionenergygraphics.git
git clone git@github.com:pyanodon/pycoalprocessinggraphics.git
git clone git@github.com:pyanodon/pyraworesgraphics.git
git clone git@github.com:pyanodon/pyhightechgraphics.git
git clone git@github.com:pyanodon/pypetroleumhandlinggraphics.git
git clone git@github.com:pyanodon/pyalienlifegraphics1.git pyalienlifegraphics
git clone git@github.com:pyanodon/pyalienlifegraphics2.git
git clone git@github.com:pyanodon/pyalienlifegraphics3.git

git clone --mirror git@github.com:pyanodon/pycoalprocessing.git
git clone --mirror git@github.com:pyanodon/pyalienlife.git
git clone --mirror git@github.com:pyanodon/pyrawores.git
git clone --mirror git@github.com:pyanodon/pyfusionenergy.git
git clone --mirror git@github.com:pyanodon/pypetroleumhandling.git
git clone --mirror git@github.com:pyanodon/pyhightech.git
git clone --mirror git@github.com:pyanodon/pyindustry.git
git clone --mirror git@github.com:pyanodon/pyaliens.git
git clone --mirror git@github.com:pyanodon/pyfusionenergygraphics.git
git clone --mirror git@github.com:pyanodon/pycoalprocessinggraphics.git
git clone --mirror git@github.com:pyanodon/pyraworesgraphics.git
git clone --mirror git@github.com:pyanodon/pyhightechgraphics.git
git clone --mirror git@github.com:pyanodon/pypetroleumhandlinggraphics.git
git clone --mirror git@github.com:pyanodon/pyalienlifegraphics1.git
git clone --mirror git@github.com:pyanodon/pyalienlifegraphics2.git
git clone --mirror git@github.com:pyanodon/pyalienlifegraphics3.git

java -jar bfg.jar --strip-blobs-bigger-than 250K pycoalprocessing.git
java -jar bfg.jar --strip-blobs-bigger-than 250K pyalienlife.git
java -jar bfg.jar --strip-blobs-bigger-than 250K pyrawores.git
java -jar bfg.jar --strip-blobs-bigger-than 250K pyfusionenergy.git
java -jar bfg.jar --strip-blobs-bigger-than 250K pypetroleumhandling.git
java -jar bfg.jar --strip-blobs-bigger-than 250K pyhightech.git
java -jar bfg.jar --strip-blobs-bigger-than 250K pyindustry.git
java -jar bfg.jar --strip-blobs-bigger-than 250K pyaliens.git
java -jar bfg.jar --strip-blobs-bigger-than 250K pyfusionenergygraphics.git
java -jar bfg.jar --strip-blobs-bigger-than 250K pycoalprocessinggraphics.git
java -jar bfg.jar --strip-blobs-bigger-than 250K pyraworesgraphics.git
java -jar bfg.jar --strip-blobs-bigger-than 250K pyhightechgraphics.git
java -jar bfg.jar --strip-blobs-bigger-than 250K pypetroleumhandlinggraphics1.git
java -jar bfg.jar --strip-blobs-bigger-than 250K pyalienlifegraphics1.git
java -jar bfg.jar --strip-blobs-bigger-than 250K pyalienlifegraphics2.git
java -jar bfg.jar --strip-blobs-bigger-than 250K pyalienlifegraphics3.git

# cd your-repo.git && git reflog expire --expire=now --all && git gc --prune=now --aggressive && git push && cd ..

cd pycoalprocessing.git && git reflog expire --expire=now --all && git gc --prune=now --aggressive && git push
cd .. && cd pyalienlife.git && git reflog expire --expire=now --all && git gc --prune=now --aggressive && git push
cd .. && cd pyrawores.git && git reflog expire --expire=now --all && git gc --prune=now --aggressive && git push
cd .. && cd pyfusionenergy.git && git reflog expire --expire=now --all && git gc --prune=now --aggressive && git push
cd .. && cd pypetroleumhandling.git && git reflog expire --expire=now --all && git gc --prune=now --aggressive && git push
cd .. && cd pyhightech.git && git reflog expire --expire=now --all && git gc --prune=now --aggressive && git push
cd .. && cd pyindustry.git && git reflog expire --expire=now --all && git gc --prune=now --aggressive && git push
cd .. && cd pyaliens.git && git reflog expire --expire=now --all && git gc --prune=now --aggressive && git push
cd .. && cd pyfusionenergygraphics.git && git reflog expire --expire=now --all && git gc --prune=now --aggressive && git push
cd .. && cd pycoalprocessinggraphics.git && git reflog expire --expire=now --all && git gc --prune=now --aggressive && git push
cd .. && cd pyraworesgraphics.git && git reflog expire --expire=now --all && git gc --prune=now --aggressive && git push
cd .. && cd pyhightechgraphics.git && git reflog expire --expire=now --all && git gc --prune=now --aggressive && git push
cd .. && cd pypetroleumhandlinggraphics.git && git reflog expire --expire=now --all && git gc --prune=now --aggressive && git push
cd .. && cd pyalienlifegraphics1.git && git reflog expire --expire=now --all && git gc --prune=now --aggressive && git push
cd .. && cd pyalienlifegraphics2.git && git reflog expire --expire=now --all && git gc --prune=now --aggressive && git push
cd .. && cd pyalienlifegraphics3.git && git reflog expire --expire=now --all && git gc --prune=now --aggressive && git push
cd ..
