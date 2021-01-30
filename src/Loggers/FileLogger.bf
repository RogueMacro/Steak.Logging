using System;
using System.IO;

namespace Steak.Logging
{
	public class FileLogger	: StreamLogger
	{
		public this(StringView path) : base(new StreamWriter(new FileStream()..Open(path, .Append, .Write), .UTF8, 0, true))
		{}

		public this(StringView path, StringView name, LogLevel level = .Trace) : base(new StreamWriter(new FileStream()..Open(path, .Append, .Write), .UTF8, 0, true), name, level)
		{}

		public this(StringView path, StringView name, StringView format, LogLevel level = .Trace) : base(new StreamWriter(new FileStream()..Open(path, .Append, .Write), .UTF8, 0, true), name, format, level)
		{}
	}
}
