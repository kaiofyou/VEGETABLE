# Sử dụng base image là Node.js phiên bản 18
FROM node:18-alpine

# Đặt thư mục làm việc bên trong container
WORKDIR /app

# Sao chép file package.json và cài đặt dependencies
COPY package*.json ./
RUN npm install

# Sao chép toàn bộ mã nguồn vào thư mục làm việc
COPY . .

# Mở cổng 8000 để ứng dụng có thể truy cập từ bên ngoài
EXPOSE 8000

# Lệnh để khởi chạy ứng dụng khi container bắt đầu
CMD ["node", "app.js"]