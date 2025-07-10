# Dùng image nginx nhẹ và phổ biến
FROM nginx:alpine

# Xoá trang mặc định của nginx
RUN rm -rf /usr/share/nginx/html/*

# Copy toàn bộ dự án vào thư mục public của nginx
COPY . /usr/share/nginx/html

# Expose port 80 (cổng mặc định của nginx)
EXPOSE 80

# Lệnh khởi chạy nginx
CMD ["nginx", "-g", "daemon off;"]
