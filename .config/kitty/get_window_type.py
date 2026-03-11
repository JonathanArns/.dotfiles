from kitty.boss import Boss
import kitty.key_encoding as ke
from kittens.tui.handler import result_handler


def main(args: list[str]) -> str:
    pass

@result_handler(no_ui=True)
def handle_result(args: list[str], stdin_data: str, target_window_id: int, boss: Boss) -> None:
    window = args[1]

    w = boss.window_id_map.get(int(window))
    if w is None:
        return "unknown_window"

    if w.screen.is_main_linebuf():
        return "linebuf"

    if w.title and "vim" in w.title.lower():
        return "vim"

    for p in w.child.foreground_processes:
        if "vim" in " ".join(p.get("cmdline", [])).lower():
            return "vim"

    return "non_vim_application"
