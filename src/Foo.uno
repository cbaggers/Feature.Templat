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
	public extern(!MOBILE) class Foo
	{
		public string AAA = "n/a";
		public int BBB = 0;

	}

	public extern(iOS) class Foo
	{
		public string AAA = "iOSAAA";
		public int BBB = 0;

	}

	public extern(Android) class Foo
	{
		public string AAA = "AndroidAAA";
		public int BBB = 0;

	}
}
