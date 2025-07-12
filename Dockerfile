# Sử dụng base image là Node.js phiên bản 18
FROM node:18-alpine

# Đặt thư mục làm việc bên trong container
WORKDIR /app

# ---- XÓA CÁC DÒNG NÀY ----
# COPY package*.json ./
# RUN npm install
# -------------------------

# Sao chép toàn bộ mã nguồn vào thư mục làm việc
COPY . .

# Mở cổng mà ứng dụng sẽ chạy (ví dụ: 8000)
EXPOSE 8000

# Chạy một máy chủ http đơn giản để phục vụ các file tĩnh
# Cài đặt http-server và khởi chạy nó
RUN npm install -g http-server
CMD [ "http-server", "-p", "8000" ]