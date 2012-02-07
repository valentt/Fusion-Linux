const St = imports.gi.St;
const Main = imports.ui.main;
const PopupMenu = imports.ui.popupMenu;
const Applet = imports.ui.applet;

const Gettext = imports.gettext;
const _ = Gettext.gettext;


function MyPopupMenuItem()
{
    this._init.apply(this, arguments);
}

MyPopupMenuItem.prototype =
{
    __proto__: PopupMenu.PopupBaseMenuItem.prototype,
    _init: function(icon, text, params)
    {
        PopupMenu.PopupBaseMenuItem.prototype._init.call(this, params);
        this.box = new St.BoxLayout({ style_class: 'popup-combobox-item' });
        this.icon = icon;
        this.box.add(this.icon);
        this.label = new St.Label({ text: text });
        this.box.add(this.label);
        this.addActor(this.box);
    }
};

function MyMenu(launcher, orientation) {
    this._init(launcher, orientation);
}

MyMenu.prototype = {
    __proto__: PopupMenu.PopupMenu.prototype,
    
    _init: function(launcher, orientation) {
        this._launcher = launcher;        
                
        PopupMenu.PopupMenu.prototype._init.call(this, launcher.actor, 0.0, orientation, 0);
        Main.uiGroup.add_actor(this.actor);
        this.actor.hide();            
    }
};

function MyApplet(orientation) {
    this._init(orientation);
}

MyApplet.prototype = {
	    __proto__: Applet.IconApplet.prototype,

	    _init: function(orientation) {
	        Applet.IconApplet.prototype._init.call(this, orientation);
	        
	        try {        
	            this.set_applet_icon_name("user-home");
	            this.set_applet_tooltip(_("Places and bookmarks"));
	            
	            this.menuManager = new PopupMenu.PopupMenuManager(this);
	            this.menu = new MyMenu(this, orientation);
	            this.menuManager.addMenu(this.menu);
	            
	            this._display();
	        }
	        catch (e) {
	            global.logError(e);
	        };
	    },
	    
	    on_applet_clicked: function(event) {
	        this.menu.toggle();        
	    },
	    
	    _display: function() {
	    	let placeid = 0;
	    	this.placeItems = [];

	    	this.defaultPlaces = Main.placesManager.getDefaultPlaces();
	    	this.bookmarks     = Main.placesManager.getBookmarks();
	    	
	    	// Display default places
	    	for ( placeid; placeid < this.defaultPlaces.length; placeid++) {
	    		let icon = this.defaultPlaces[placeid].iconFactory(22);
	    	    this.placeItems[placeid] = new MyPopupMenuItem(icon, _(this.defaultPlaces[placeid].name));
	            this.placeItems[placeid].place = this.defaultPlaces[placeid];

	            this.menu.addMenuItem(this.placeItems[placeid]);
	            this.placeItems[placeid].connect('activate', function(actor, event) {
	            	actor.place.launch();
	            });
	        }      

	    	this.menu.addMenuItem(new PopupMenu.PopupSeparatorMenuItem());
	    	
	    	let bookmarkid = 0;
	    	// Display default bookmarks
	    	for ( bookmarkid; bookmarkid < this.bookmarks.length; bookmarkid++, placeid++) {
	    		let icon = this.bookmarks[bookmarkid].iconFactory(22);
	    	    this.placeItems[placeid] = new MyPopupMenuItem(icon, _(this.bookmarks[bookmarkid].name));
	            this.placeItems[placeid].place = this.bookmarks[bookmarkid];

	    	    this.menu.addMenuItem(this.placeItems[placeid]);
	    	    this.placeItems[placeid].connect('activate', function(actor, event) {
	    	    	actor.place.launch();
	    	    });
	    	};
	    }
};

function main(metadata, orientation) {  
    let myApplet = new MyApplet(orientation);
    return myApplet;      
};
