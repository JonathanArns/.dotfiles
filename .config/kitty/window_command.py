from kittens.tui.handler import result_handler


def main():
    pass

@result_handler(no_ui=True)
def handle_result(args, result, target_window_id, boss):
    cmd = args[1]
    direction = args[2]
    if cmd == "switch":
        boss.active_tab.neighboring_window(direction)
    if cmd == "resize":
        boss.active_tab.resize_window(direction, 1)
