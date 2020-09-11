import core.stdc.stdlib;
import std.string;
import std.stdio;
import mpv;

int playFile(mpv_handle *handle, string file) {
    const(char)** cmd = cast(const(char)**) malloc(3);

    cmd[0] = toStringz("loadfile");
    cmd[1] = toStringz(file);
    cmd[2] = null;
    int status = mpv_command(handle, cmd);

    free(cmd);
    return status;
}


int main(string[] args) {
    mpv_handle *handle = mpv_create();
    mpv_initialize(handle);

    string file = args[1];
    int status = playFile(handle, file);
    
    if (status != 0) {
        const(char) *error_msg = mpv_error_string(status); 
        writeln(fromStringz(error_msg));
        return status;
    }

    while(true) {
        mpv_event *event = mpv_wait_event(handle, 10000);
        
        // check for MPV_EVENT_SHUTDOWN 
        if (event.event_id == 1) {
            break;
        } 
    }
    
    return 0;
}

