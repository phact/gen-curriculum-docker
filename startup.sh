cp ~/.ssh/id_rsa .
docker build -t gen-curriculum-image .
docker run \
   --net=host -d  \
  -p 0.0.0.0:8080:8080 \
  -p 0.0.0.0:8000:8000 \
  --name gen-curriculum gen-curriculum-image
