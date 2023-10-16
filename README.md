# Docker commands
`Docker` đóng gói các thành phần cần thiết để chúng ta có thể build một app thành một image, một thứ như vitual chạy được trên mọi máy tính mà không cần quan tâm tới cấu hình cần thiết cho app. Chúng ta có thể điều hướng tới một `container` đang chạy và tương tác với chúng.

## Container
`Container` là một instance của một image.

## Command
```
docker ps -a                                : Danh sách các container đang chạy
docker run --rm -p 3000:3000 <image_name>   : run một image
docker stop <id>                            : dừng một container
docker exec -it <container_name> /bin/sh    : truy cập vào một container và mở một terminal để tương tác với container đó.
docker build                                : build một docker
```
