#!/bin/bash

# Test script for data extraction logic
echo "Testing data extraction logic..."

# Test data (Pikachu values)
HEIGHT=4
WEIGHT=60
NAME="pikachu"
TYPE="electric"

# Test the conversion logic
formatted_height=$(echo "scale=1; $HEIGHT / 10" | bc -l | sed 's/^\./0./')
formatted_weight=$(echo "scale=1; $WEIGHT / 10" | bc -l | sed 's/^\./0./' | sed 's/\.0$//')
name=$(echo "$NAME" | sed 's/.*/\u&/')
type=$(echo "$TYPE" | sed 's/.*/\u&/')

echo "Original values:"
echo "  Height: $HEIGHT decimeters"
echo "  Weight: $WEIGHT hectograms"
echo "  Name: $NAME"
echo "  Type: $TYPE"
echo ""
echo "Converted values:"
echo "  Height: $formatted_height meters"
echo "  Weight: $formatted_weight kilograms"
echo "  Name: $name"
echo "  Type: $type"
echo ""
echo "Final output:"
echo "$name is of type $type, weighs ${formatted_weight}kg, and is ${formatted_height}m tall." 