#!/bin/bash

conda activate llm
export WANDB_API_KEY="4afeb050111c67af2b2b80f0741d5233f38a8910"
export ACCELERATE_LOG_LEVEL=info

# Run vllm-serve in the background with nohup
# nohup env CUDA_VISIBLE_DEVICES=0 trl vllm-serve --model "Qwen/Qwen2.5-3B" > vllm-serve.log 2>&1 &
# VLLM_PID=$!
# echo "vLLM server started with PID: $VLLM_PID"

# Run accelerate launch in the background with nohup
nohup env CUDA_VISIBLE_DEVICES=1,2,3 ACCELERATE_LOG_LEVEL=info\
    accelerate launch --config_file recipes/accelerate_configs/zero2.yaml --num_processes=3 \
    src/open_r1/intuitor.py --config recipes/Qwen2.5-3B/intuitor/config_demo.yaml --wandb_project open-r1 --run_name Qwen2.5-Intuitor-3B > run_intuitor.log 2>&1 &
TRAINING_PID=$!
echo "Training process started with PID: $TRAINING_PID"

echo "Both processes started in the background. Check vllm-serve.log and run_intuitor.log for output."
