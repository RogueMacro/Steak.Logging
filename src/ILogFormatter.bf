using System;

namespace Steak.Logging
{
	public interface ILogFormatter
	{
		public void Format(BaseLogger logger, LogLevel level, StringView format, StringView message, String output);
	}
}
