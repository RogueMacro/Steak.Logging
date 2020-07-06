using System;

namespace Steak.Logging
{
	public class FileLogger	: ILogger
	{
		public this() : base()
		{}

		public this(String name, LogLevel level = .Trace) : base(name, level)
		{}

		public this(String name, String format, LogLevel level = .Trace) : base(name, format, level)
		{}

		public override void Log(LogLevel level, StringView str, params Object[] args)
		{
			let logger = scope Logger();
			logger.Error("FileLogger not implemented");
		}
	}
}
