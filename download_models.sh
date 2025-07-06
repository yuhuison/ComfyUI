#!/bin/bash
set -e
echo 'Downloading model files from HuggingFace...'

mkdir -p ./models/diffusion_models ./models/vae ./models/clip

wget -c 'https://huggingface.co/QuantStack/Wan2.1_T2V_14B_FusionX_VACE/resolve/main/Wan2.1_T2V_14B_FusionX_VACE-FP8.safetensors' \
     -O 'models/diffusion_models/Wan2.1_T2V_14B_FusionX_VACE-FP8.safetensors'

wget -c 'https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/Wan2_1_VAE_bf16.safetensors' \
     -O 'models/vae/Wan2_1_VAE_bf16.safetensors'

wget -c 'https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/text_encoders/umt5_xxl_fp16.safetensors' \
     -O 'models/clip/umt5_xxl_fp16.safetensors'
