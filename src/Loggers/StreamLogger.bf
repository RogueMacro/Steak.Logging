using System;
using System.IO;

namespace Steak.Logging
{
	public class StreamLogger : BaseLogger
	{
		public StreamWriter Out ~ if (mOwnsStreamWriter) delete _;
		private bool mOwnsStreamWriter;

		public this(StreamWriter _out, LogLevel level = .Default, bool ownsStreamWriter = false) : base(level, null)
		{
			Out = _out;
			mOwnsStreamWriter = ownsStreamWriter;
		}

		public this(StreamWriter _out, StringView name, LogLevel level = .Default, bool ownsStreamWriter = false) : base(name, level, null)
		{
			Out = _out;
			mOwnsStreamWriter = ownsStreamWriter;
		}

		public this(StreamWriter _out, StringView name, StringView format, LogLevel level = .Default, bool ownsStreamWriter = false) : base(name, format, level, null)
		{
			Out = _out;
			mOwnsStreamWriter = ownsStreamWriter;
		}

		protected override void Log(ConsoleColor color, StringView message)
		{
			Out.WriteLine(message);
		}
	}
}
