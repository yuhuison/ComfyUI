# 基于官方 CUDA 镜像（用于 GPU 加速）
FROM nvidia/cuda:12.9.1-cudnn-devel-ubi9

# 安装系统依赖
RUN apt update && apt install -y \
    python3 python3-pip git ffmpeg libgl1 \
    && rm -rf /var/lib/apt/lists/*

# 创建工作目录
WORKDIR /comfyui

# 复制项目代码（魔改版）
COPY . .

# 安装 Python 依赖
RUN pip3 install --upgrade pip && \
    pip3 install --no-cache-dir -r requirements.txt

COPY download_models.sh .
RUN bash download_models.sh

# 启动 ComfyUI
CMD ["python3", "main.py", "--listen", "0.0.0.0", "--port", "8188"]
