#!/bin/bash

# Test script for data extraction logic
echo "Testing data extraction logic..."

# Test data (Pikachu values)
HEIGHT=4
WEIGHT=60
NAME="pikachu"
TYPE="electric"

# Test the conversion logic
HEIGHT_M=$(echo "scale=1; $HEIGHT / 10" | bc -l | sed 's/^\./0./')
WEIGHT_KG=$(echo "scale=1; $WEIGHT / 10" | bc -l | sed 's/^\./0./' | sed 's/\.0$//')
NAME_CAP=$(echo "$NAME" | sed 's/.*/\u&/')
TYPE_CAP=$(echo "$TYPE" | sed 's/.*/\u&/')

echo "Original values:"
echo "  Height: $HEIGHT decimeters"
echo "  Weight: $WEIGHT hectograms"
echo "  Name: $NAME"
echo "  Type: $TYPE"
echo ""
echo "Converted values:"
echo "  Height: $HEIGHT_M meters"
echo "  Weight: $WEIGHT_KG kilograms"
echo "  Name: $NAME_CAP"
echo "  Type: $TYPE_CAP"
echo ""
echo "Final output:"
echo "$NAME_CAP is of type $TYPE_CAP, weighs ${WEIGHT_KG}kg, and is ${HEIGHT_M}m tall." 