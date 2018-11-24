/**
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 *
 * AUTHORS
 * gyan000 <gyan000 (at] ijaz.fr>
 */
using EOSConnect;

public class EOSConnect.Indicator : Wingpanel.Indicator {

    private Gtk.Spinner? display_widget = null;
    // private Gtk.StyleContext style_context;
    // private Nightlight.Widgets.PopoverWidget? popover_widget = null;

    public Indicator (Wingpanel.IndicatorManager.ServerType server_type) {
        Object (code_name: "wingpanel-indicator-eosconnect",
                display_name: _("EOSConnect"),
                description: _("EOSConnect indicator"));
    }

    public override Gtk.Widget get_display_widget () {
        debug ("get_display_widget");
        if (display_widget == null) {
            display_widget = new Gtk.Spinner ();
        }
        return display_widget;
    }

    public override Gtk.Widget? get_widget () {
        debug ("get_widget");
        return null;
    }

    public override void opened () {
        debug ("opened");
    }

    public override void closed () {
        debug ("closed");
    }
}

public Wingpanel.Indicator? get_indicator (Module module, Wingpanel.IndicatorManager.ServerType server_type) {
    debug ("Activating EOSConnect Indicator");

    if (server_type != Wingpanel.IndicatorManager.ServerType.SESSION) {
        warning ("Wingpanel is not in session, not loading EOSConnect indicator.");
        return null;
    }

    var indicator = new EOSConnect.Indicator (server_type);
    return indicator;
}
