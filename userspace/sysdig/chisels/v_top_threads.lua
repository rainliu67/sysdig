--[[
Copyright (C) 2013-2014 Draios inc.
 
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License version 2 as
published by the Free Software Foundation.


This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
--]]

view_info = 
{
	id = "LD_top_threads",
	name = "Top Threads",
	description = "This view is available for processes, and lists the threads inside the process, showing usage of resources like CPU, memory, disk and network for each thread.",
	tags = {"Default"},
	view_type = "table",
	applies_to = "proc.pid,proc.name,container.id,fd.sport",
	is_root = true,
	drilldown_target = "LD_top_files",
	use_defaults = true,
	columns = 
	{
		{
			name = "NA",
			field = "thread.tid",
			is_key = true
		},
		{
			name = "PID",
			description = "Process PID.",
			field = "proc.pid",
			colsize = 8,
		},
		{
			name = "TID",
			description = "Thread-specific PID.",
			field = "thread.tid",
			colsize = 8,
		},
		{
			name = "CPU",
			field = "proc.cpu",
			description = "Amount of CPU used by the proccess.",
			colsize = 8,
			aggregation = "AVG",
			is_sorting = true
		},
		{
			name = "FILE",
			field = "evt.buflen.file",
			description = "Total (input+output) file I/O bytes generated by the process during the sampling interval. On trace files, this is the sum for the whole file.",
			colsize = 8,
			aggregation = "SUM"
		},
		{
			name = "NET",
			field = "evt.buflen.net",
			description = "Total (input+output) network I/O bytes generated by the process during the sampling interval. On trace files, this is the sum for the whole file.",
			colsize = 8,
			aggregation = "SUM"
		},
		{
			name = "Command",
			description = "The full command line of the process.",
			field = "proc.exeline",
			colsize = 200
		}
	}
}
