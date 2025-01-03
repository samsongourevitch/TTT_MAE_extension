DATA_PATH_BASE='/nfs/scistore19/alistgrp/trobert/git_repo/TTT_MAE_extension/imagenetC_OOD/full'
DATASET='snow'
LEVEL='3'
ROUND='0'

OUTPUT_DIR_BASE='results_TTT/OOD/Latents'

RESUME_MODEL='checkpoints/mae_pretrain_vit_large_full.pth'
RESUME_FINETUNE='checkpoints/prob_lr1e-3_wd.2_blk12_ep20.pth'

#for ROUND in 4 5 ; do 

# RESUME_MODEL="results/during_training/level_3/round_${ROUND}/checkpoints/model_49.pth"
# RESUME_FINETUNE="results/during_training/level_3/round_${ROUND}/checkpoints/model_49.pth"

python main_test_time_training.py \
    --seed 0 \
    --data_path "$DATA_PATH_BASE/$DATASET/$LEVEL/" \
    --model mae_vit_large_patch16 \
    --input_size 224 \
    --batch_size 32 \
    --steps_per_example 20 \
    --mask_ratio 0.75 \
    --blr 1e-2 \
    --norm_pix_loss \
    --optimizer_type 'sgd' \
    --classifier_depth 12 \
    --head_type "vit_head" \
    --single_crop \
    --dataset_name "imagenet_c" \
    --output_dir "$OUTPUT_DIR_BASE/$DATASET/level_$LEVEL/round_$ROUND" \
    --dist_url "file://$OUTPUT_DIR_BASE/$TIME" \
    --finetune_mode 'encoder' \
    --resume_model ${RESUME_MODEL} \
    --resume_finetune ${RESUME_FINETUNE} \
    \
    --length 250 \
    --save_latents \
    #--from_custom_model
    
#done