DATA_PATH_BASE='/nfs/scistore19/alistgrp/trobert/git_repo/TTT_MAE_extension/imagenetC/full'
DATASET='defocus_blur'
LEVEL='3'
ROUND='3'
RESUME_MODEL='checkpoints/mae_pretrain_vit_large_full.pth'
RESUME_MODEL='results/defocus_blur/level_3/round_3/checkpoints/model_49.pth'
RESUME_FINETUNE='checkpoints/prob_lr1e-3_wd.2_blk12_ep20.pth'
RESUME_FINETUNE='results/defocus_blur/level_3/round_3/checkpoints/model_49.pth'
OUTPUT_DIR_BASE='results/baseline'

python test_without_adaptation.py \
    --seed 0 \
    --data_path "$DATA_PATH_BASE/$DATASET/$LEVEL" \
    --model mae_vit_large_patch16 \
    --input_size 224 \
    --resume_model ${RESUME_MODEL} \
    --resume_finetune ${RESUME_FINETUNE} \
    --output_dir "$OUTPUT_DIR_BASE/$DATASET/level_$LEVEL/round_$ROUND" \
    --classifier_depth 12 \
    --head_type "vit_head" \
    \
    --save_latents \
    --from_custom_model \