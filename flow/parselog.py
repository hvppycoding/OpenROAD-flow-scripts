#!/usr/bin/env python3
import glob
import json


def get_summary_line(design: str, variant: str):
    json_file = f'logs/asap7/{design}/{variant}/6_report.json'
    clock_period_file = f'results/asap7/{design}/{variant}/clock_period.txt'

    with open(clock_period_file, 'r') as f:
        clk_period = f.read().strip()

    tns_key = "finish__timing__setup__tns"
    ws_key = "finish__timing__setup__ws"
    power_key = "finish__power__total"
    instance_count_key = "finish__design__instance__count"
    drv_slew_key = "finish__timing__drv__max_slew"
    drv_cap_key = "finish__timing__drv__max_cap"
    drv_fanout_key = "finish__timing__drv__max_fanout"

    with open(json_file, 'r') as f:
        data = json.load(f)
        tns = data[tns_key]
        ws = data[ws_key]
        power = data[power_key]
        instance_count = data[instance_count_key]
        drv_slew = data[drv_slew_key]
        drv_cap = data[drv_cap_key]
        drv_fanout = data[drv_fanout_key]

    summary = [design, variant, instance_count, clk_period, tns, ws, power, 
               drv_slew, drv_cap, drv_fanout]
    summary = [str(x) for x in summary]

    return "\t".join(summary)

def parse_log_files():
    log_files = sorted(glob.glob('logs/asap7/*/*/6_report.json'))
    for log_file in log_files:
        _, _, design, variant, _= log_file.split("/")
        print(get_summary_line(design, variant))


if __name__ == "__main__":
    parse_log_files()