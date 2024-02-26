#!/usr/bin/env python3
import argparse
import os
import matplotlib.pyplot as plt


def run(filepath: str):
    if not os.path.exists(filepath):
        raise FileNotFoundError(f"File not found: {filepath}")
    
    npins = []
    iterations = []    
    with open(filepath, 'r') as f:
        lines = f.readlines()

        print("Pins, Iterations")
        for line in lines:
            if "#Iterations:" in line.strip():
                _, npin, iteration = line.split(", ")
                npin = int(npin.split(" ")[1])
                iteration = int(iteration.split(" ")[1])
                print(f"{npin}, {iteration}")
                npins.append(npin)
                iterations.append(iteration)
    
    pin_max = max(npins)
    pin_min = min(npins)
    iteration_max = max(iterations)
    iteration_min = min(iterations)
    xy_max = max(pin_max, iteration_max)
    xy_min = 0
    
    plt.scatter(npins, iterations)
    plt.xlabel("Number of Pins")
    plt.ylabel("Iterations")
    plt.xlim(xy_min, xy_max)
    plt.ylim(xy_min, xy_max)
    plt.title("Number of Pins vs Iterations")
    output_file = os.path.basename(filepath).split(".")[0]
    plt.savefig(f"{output_file}.png")

def main():
    parser = argparse.ArgumentParser(description='')
    parser.add_argument('filepath', type=str, help='The filepath to process.')
    args = vars(parser.parse_args())

    run(args['filepath'])
    

if __name__ == "__main__":
    main()