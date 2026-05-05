#!/usr/bin/env bash
set -e
python data_split.py
python feature_extract.py
python gen_data.py
python xgb.py
