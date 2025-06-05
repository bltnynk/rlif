ps ux \
  | grep "\-u src/open_r1/grpo.py" \
  | grep -v grep \
  | awk '{print $2}' \
  | xargs kill

ps ux \
  | grep "/home/server37/anaconda3/envs/llm/bin/trl vllm-serve" \
  | grep -v grep \
  | awk '{print $2}' \
  | xargs kill

ps ux \
  | grep "/home/server37/anaconda3/envs/llm/bin/python3.11 -c from multiprocessing" \
  | grep -v grep \
  | awk '{print $2}' \
  | xargs kill
