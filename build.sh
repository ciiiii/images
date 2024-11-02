set -ex;

IMAGE_FOLDER=$1
IFS='/' read -ra parts <<< "$IMAGE_FOLDER"
echo ${parts[@]}
if [ ${#parts[@]} -ne 2 ]; then
    echo "Invalid argument ${IMAGE_FOLDER}. Usage: ./build.sh <image-name>/<image-tag>"
    exit 1
fi
IMAGE_NAME=${parts[0]}
IMAGE_TAG=${parts[1]}
IMAGE="${IMAGE_REPO}/${IMAGE_NAME}:${IMAGE_TAG}"

http_code=$(curl -s -o /dev/null -w "%{http_code}" https://hub.docker.com/v2/namespaces/${IMAGE_REPO}/repositories/${IMAGE_NAME}/tags/${IMAGE_TAG})

if [ $http_code -eq 200 ]; then
    echo "Image ${IMAGE} already exists in Docker Hub. Skipping build."
    exit 0
elif [ $http_code -eq 404 ]; then
    echo "Image ${IMAGE} does not exist in Docker Hub. Building image..."
    docker build -t ${IMAGE} ${IMAGE_FOLDER}
    docker push ${IMAGE}
else
    echo "Failed to check if image ${IMAGE} exists in Docker Hub, http code: ${http_code}"
    exit 1
fi