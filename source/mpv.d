module mpv;

// Bindings to mpv/client.h
// general docs: https://mpv.io/manual/stable/#embedding-into-other-programs-libmpv
struct  mpv_handle {}
struct  mpv_event {
    int event_id;
}

extern (C) mpv_handle *mpv_create();
extern (C) int mpv_initialize(mpv_handle *ctx);
extern (C) int mpv_set_option_string(mpv_handle *ctx, const(char) *name, const(char) *data);
// command list https://mpv.io/manual/stable/#list-of-input-commands
extern (C) int mpv_command(mpv_handle *ctx, const(char)**  args);
extern (C) mpv_event *mpv_wait_event(mpv_handle *ctx, double timeout);
extern (C) const(char) *mpv_error_string(int error);
// property list https://mpv.io/manual/stable/#properties
extern (C) char *mpv_get_property_string(mpv_handle *ctx, const char *name);
extern (C) int mpv_set_property_string(mpv_handle *ctx, const char *name, const char *data);
