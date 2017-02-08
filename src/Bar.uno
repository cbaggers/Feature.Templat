using Uno;
using Uno.UX;
using Uno.Threading;
using Uno.Collections;
using Uno.Compiler.ExportTargetInterop;
using Fuse;
using Fuse.Triggers;
using Fuse.Controls;
using Fuse.Controls.Native;
using Fuse.Controls.Native.Android;

namespace Fuse.SuchAService
{
	public extern(!MOBILE) class Bar
	{
		public string VitalData = "n/a";
	}

	public extern(iOS) class Bar
	{
		public string VitalData = "iOSVitalData";
		ObjC.Object _handle;

		public Bar(ObjC.Object handle)
		{
			_handle = handle;
		}
	}

	public extern(Android) class Bar
	{
		public string VitalData = "AndroidVitalData";
		Java.Object _handle;

		public Bar(Java.Object handle)
		{
			_handle = handle;
		}
	}
}
