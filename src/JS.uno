using Uno;
using Uno.UX;
using Uno.Threading;
using Uno.Text;
using Uno.Platform;
using Uno.Compiler.ExportTargetInterop;
using Uno.Collections;
using Fuse;
using Fuse.Scripting;
using Fuse.Reactive;

namespace Fuse.SuchAService
{
	/**
	*/
	[UXGlobalModule]
	public sealed class SuchAServiceModule : NativeModule
	{
		static readonly SuchAServiceModule _instance;

		public SuchAServiceModule()
		{
			if(_instance != null) return;
			Resource.SetGlobalKey(_instance = this, "SuchAService");

			Core.Init();

			//AddMember(new NativeProperty<bool, bool>("testProperty", TestProperty));
			AddMember(new NativePromise<Bar, Scripting.Object>("requestSuchBar", SuchAServiceRequest, BarToJS));
		}

		static Future<Token> SuchAServiceRequest(object[] args)
		{
			var fooParams = FooFromJS((Scripting.Object)args[0]);
			return new SuchAServiceRequest(fooParams);
		}

		static CardParams FooFromJS(Scripting.Object obj)
		{
			var foo = new Foo();
			foo.AAA = (string)obj["aaa"];
			foo.BBB = Marshal.ToInt(obj["bbb"]);
			return foo;
		}

		static Scripting.Object BarToJS(Context c, Bar token)
		{
			var res = c.NewObject();
			res["WOAH"] = token.VitalData;
			return res;
		}
	}
}
