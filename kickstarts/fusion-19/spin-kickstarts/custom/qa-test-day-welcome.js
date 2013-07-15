/* Fedora Test Day welcome screen.
 * 
 * Based on Fedora LiveCD welcome screen from Cosimo Cecchi:
 * http://git.fedorahosted.org/cgit/anaconda.git/tree/data/liveinst/gnome?h=f18-branch
 */

const Gdk = imports.gi.Gdk;
const GdkPixbuf = imports.gi.GdkPixbuf;
const Gio = imports.gi.Gio;
const GLib = imports.gi.GLib;
const Gtk = imports.gi.Gtk;
const Lang = imports.lang;
const Pango = imports.gi.Pango;

const Gettext = imports.gettext;
const _ = imports.gettext.gettext;

const LOCALE_DIR = '/usr/share/locale';

let anacondaApp = null;

function makeLabel(label, button) {
		let widget = new Gtk.Label();

		if (button)
				widget.set_markup(
					'<b><span size="x-large">' + label + '</span></b>');
		else {
				widget.set_line_wrap(true);
				widget.set_justify(Gtk.Justification.CENTER);
				widget.set_margin_top(32);
				widget.set_margin_bottom(32);

				widget.set_markup(
					'<span size="large">' + label + '</span>');
		}

		return widget;
}

const WelcomeWindow = new Lang.Class({
	Name: 'WelcomeWindow',

	_init: function(application) {
			this.window = new Gtk.ApplicationWindow({ 
				application: application,
				type: Gtk.WindowType.TOPLEVEL,
				default_width: 600,
				default_height: 550,
				title: _("Welcome to Fedora Test Day"),
				window_position: Gtk.WindowPosition.CENTER });
			this.window.connect('key-press-event', Lang.bind(this,
					function(w, event) {
							let key = event.get_keyval()[1];

							if (key == Gdk.KEY_Escape)
									this.window.destroy();

							return false;
					}));

			let mainGrid = new Gtk.Grid({ 
				orientation: Gtk.Orientation.VERTICAL,
				row_spacing: 16,
				vexpand: true,
				hexpand: true,
				halign: Gtk.Align.CENTER,
				valign: Gtk.Align.CENTER });
			this.window.add(mainGrid);

			let buttonBox = new Gtk.Grid({
				orientation: Gtk.Orientation.HORIZONTAL,
				column_spacing: 16,
				halign: Gtk.Align.CENTER });
			mainGrid.add(buttonBox);

			let tryContent = new Gtk.Box({ 
				orientation: Gtk.Orientation.VERTICAL, spacing: 16 });
			let firefoxpix = GdkPixbuf.Pixbuf.new_from_file_at_size(
				'/usr/share/icons/Fedora/256x256/places/start-here.png',256, 256);
			tryContent.add(new Gtk.Image({ pixbuf: firefoxpix }));
			tryContent.add(makeLabel(_("Participate in the Test Day"), true));
			let tryButton = new Gtk.Button({ child: tryContent });
			buttonBox.add(tryButton);

			this._label = makeLabel(_(
				"Click the button to open a browser with the current Test Day " +
				"wiki page containing instructions and an IRC chat to discuss " +
				"any issues and questions you might have."
				), false);
			mainGrid.add(this._label);

			tryButton.connect('clicked', Lang.bind(this,
					function() {
						GLib.spawn_command_line_async('firefox');
						this.window.destroy(); 
					}));
	}
});

Gettext.bindtextdomain('anaconda', LOCALE_DIR);
Gettext.textdomain('anaconda');

GLib.set_prgname('test-day-welcome');
Gtk.init(null, null);
Gtk.Settings.get_default().gtk_application_prefer_dark_theme = true;

let application = new Gtk.Application({ 
	application_id: 'org.fedoraproject.welcome-screen',
	flags: Gio.ApplicationFlags.FLAGS_NONE });
let welcomeWindow = null;

application.connect('startup', Lang.bind(this,
		function() {
				welcomeWindow = new WelcomeWindow(application);
		}));
application.connect('activate', Lang.bind(this,
		function() {
				welcomeWindow.window.show_all();
		}));

application.run(ARGV);

